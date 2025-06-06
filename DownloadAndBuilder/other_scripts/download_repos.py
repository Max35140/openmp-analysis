#!/shared/apps/.gcc/11.2/python/3.9.5/bin/python3.9
import pandas as pd
import os
import sys
import subprocess
import shutil
import argparse
import numpy as np
import requests
from tqdm import tqdm

skip = False

tqdm.pandas()

def str2bool(v):
    if isinstance(v, bool):
        return v
    if v.lower() in ('yes', 'true', 't', 'y', '1'):
        return True
    elif v.lower() in ('no', 'false', 'f', 'n', '0'):
        return False
    else:
        raise argparse.ArgumentTypeError('Boolean value expected.')

class RepoUnavailable(Exception):
    def __init__(self,errorCode):
        self.errorCode = errorCode

    def getCode(self):
        return self.errorCode

# REPO_PATH = "/home/tim/repo_finder/openmp-usage-analysis-binaries/REPOS/"
BASE_PATH= r"/home/max/Downloads/openmp-analysis2/DownloadAndBuilder"
REPO_PATH   = BASE_PATH+"/data/"
SCRIPT_PATH = BASE_PATH+"/scripts/CI"
def cloneRepo(repoUrl, path, commit_hash=None):
    try:
        # remove any old repo
        if not os.path.isdir(path):
            # not already present:
            # download
            # check if URL is still available
            server_status = requests.head(repoUrl, allow_redirects=True)

            if int(server_status.status_code) != 200:
                print("return code was ", int(server_status.status_code))
                raise RepoUnavailable(server_status)
            subprocess.check_output(f'git clone --depth 1 {repoUrl} {path}', stderr=subprocess.STDOUT, shell=True,
                                    encoding='UTF-8')
        # get current hash, remove trailing \n
        current_hash = subprocess.check_output(f'git rev-parse --verify HEAD', cwd=path, stderr=subprocess.STDOUT,
                                               shell=True, encoding='UTF-8').strip()
        if commit_hash is None or current_hash == commit_hash:
            return current_hash
        else:
            # fetch different revision
            # TODO one could check that origin-url is set up correctly
            subprocess.check_output(f'git fetch --depth 1 origin {commit_hash}', cwd=path, stderr=subprocess.STDOUT,
                                    shell=True, encoding='UTF-8')
            subprocess.check_output(f'git checkout {commit_hash}', cwd=path, stderr=subprocess.STDOUT,
                                    shell=True, encoding='UTF-8')
            return commit_hash
    except subprocess.CalledProcessError as e:
        print("ERROR: downloading Repo (",repoUrl,") to (",path,"):")
        print(e.output)
        print(f"Fehlercode: {e.returncode}")
        print(f"Fehlermeldung: {e.stderr}")

def apply_dowload_repo(row):
    h = None
    if pd.notna(row['usedHash']):
        h = row['usedHash']
    return cloneRepo(row["URL"], REPO_PATH + row["Code"].replace('/', '--'), h)

def archive_prev_file(filename):
    if os.path.isfile(filename+".back"):
        archive_prev_file(filename+".back")
    os.rename(filename,filename+".back")

def get_empty_rows(df):
    indices = []
    for i, code in df.iterrows():
        if i == 3575:
            print(i,":\n",code)
 #       if code['Code'].isnull() or not ('Code' in code) or code['Code']==np.nan or code['Code']=="NaN":
  #          print("Index ",i," has empty code")
   #         indices.append(i)
#        else:
#            print("Index ",i," code = ",code['Code'])
        if i ==3575 :
            return indices
    return indices
 
def main():
    global REPO_PATH
    global BASE_PATH
    global SCRIPT_PATH
    parser = argparse.ArgumentParser(
        prog="openmp repo downloader",
        description="CLI Tool for our OpenMP Study"
    )
    parser.add_argument("csvSource", type=str, default="ci.csv",help="CSV Repo to process")
    parser.add_argument("--basePath",type=str,default=".",help="Set the Base path of the binary repository, default assumes current directory")
    parser.add_argument("--binaryPath",type=str,default=".",help="Set the Base path of the binary repository, default assumes current directory")
    parser.add_argument("--repoPath",type=str,default="/tmp",help="Set the path where the repositories will be checked out, default is /tmp/ recommend setting a local scatch directory")
    parser.add_argument("--csvOutput", type=str, default="result.csv", help="The output file to write to (default: result.csv)")
    parser.add_argument(
        "--intermediateResultsFile","-i",default="result.incomplete.csv",help="FileName to store incomplete data in case of emergency"
    )
    parser.add_argument("--doNotPromoteTableColumns", type =str2bool, default =False,help="Do not add columns")
    parser.add_argument(
        "--preserve", "-p", help="preserve previous output files", type=str2bool,default=True
    )
    parser.add_argument("--resume","-r",help="Resume - if present - from previous incomplete.csv",action='store_true')
    parser.add_argument("--expert","-e",type = str, default = "??", help="Expert Initials")
    parser.add_argument("--nextActionItem","-n",help="Stop and Print Next Action Item",action='store_true')
    parser.add_argument("--verbose","-v",help="Verbose",action='store_true')
    parser.add_argument("--buildScriptPath",help="Location of build-scripts")
    parser.add_argument("--stopAtFail",help="Stop at the first fail",action='store_true')
    # parser.add_argument('--feature', default=True, action=argparse.BooleanOptionalAction)

    # parser.add_argument('--feature', dest='feature', action='store_true')
    # parser.add_argument('--no-feature', dest='feature', action='store_false')
    # parser.set_defaults(feature=True)
    args = parser.parse_args()

    if args.verbose:
        print("\t* Resume = ",args.resume)

    if (args.buildScriptPath):
        print("\t* Using %s build-scripts"%(args.buildScriptPath))
        SCRIPT_PATH=args.buildScriptPath
    else:
        SCRIPT_PATH=BASE_PATH+"/scripts/"+ args.expert
    if (args.basePath):
        print("\t* Base_path for download and builer is :",args.basePath)
        BASE_PATH=args.basePath
    if (args.verbose):
        print("\t* Build script path is :",SCRIPT_PATH)
    
    if (args.repoPath):
        print("\t* Replacing build-in repo path %s with %s"%(REPO_PATH,args.repoPath+"/"))
        REPO_PATH=args.repoPath + '/'

    global expertInitials
    expertInitials= args.expert
    # In the case that we resume, the csvSource is a previous result or intermediate file
    if args.resume and os.path.isfile(args.csvSource):
        #if args.resume and os.path.isfile(args.intermediateResultsFile):
        print("Continuing / Updating results ",args.intermediateResultsFile)
        df_full = pd.read_csv(args.csvSource, index_col=0)
    else:
        print("Starting new build process from CSV file",args.csvSource)
        # not resuming, use given csv file
        df_full = pd.read_csv(args.csvSource, index_col=0)
    #    try:
     #       df_full.rename(columns={"usedHash": "usedHasOriginal"})
      #  except :
       #     print("S.th. whent wrong")
        #    return "Fail"
        if not args.doNotPromoteTableColumns:
            print("Expanding table")
            df_full.insert(len(df_full.columns),"build_script",np.nan)
            df_full.insert(len(df_full.columns),"expert","ci")
            df_full.insert(len(df_full.columns),"use_cmake",np.nan)
            df_full.insert(len(df_full.columns),"use_configure",np.nan)
            df_full.insert(len(df_full.columns),"usedHash",np.nan)
            df_full.insert(len(df_full.columns),"note",np.nan)
            print(" .. done")
    # if preserve is set, secure previous intermediate Results            
    if args.preserve and os.path.isfile(args.intermediateResultsFile):
        archive_prev_file(args.intermediateResultsFile)
    
    # df = df_full.iloc[0:2]
    df = df_full
    df.dropna(subset=['Code'],inplace=True)
    if args.nextActionItem:
        print("Searching for next action item")
        for index, row in df.iterrows():
            #print("Index = ",index, "Row = ", row)
            if (pd.isna(row['build_script']) or "autofail.sh" in row['build_script']) and not (os.path.isfile(SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".sh") or os.path.isfile(SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".fail.sh")):
                print ("Next action item in row ", index,": ",row["Code"].replace('/', '--'),"\t Status:",row['build_script'])
                return
    else:
        try:
            #df = df.progress_apply(one_repo_at_a_time, axis=1)
            df = df.progress_apply(intercept_exceptions, axis=1)
            #df = df.apply(intercept_exceptions, axis=1)
        except Exception as e:
            print("Failed with ",repr(e))
            # if preserve is set, secure previous intermediate Results            
            if args.preserve and os.path.isfile(args.intermediateResultsFile):
                archive_prev_file(args.intermediateResultsFile)
            df.to_csv(args.intermediateResultsFile)
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            print(exc_type, fname, exc_tb.tb_lineno)
            return
    
        if skip:
            print("*+*+* SKIP Called *+*+*")
            # if preserve is set, secure previous intermediate Results            
            if args.preserve and os.path.isfile(args.intermediateResultsFile):
                archive_prev_file(args.intermediateResultsFile)
            df.to_csv(args.intermediateResultsFile)
            print("Updated ",args.intermediateResultsFile) 
        # df['expert'] = "tj"
    
        df.to_csv(args.csvOutput)

def intercept_exceptions(row):
    global skip
    if skip:
        return skip_repos(row)
    else:
        try:
            if not skip:
                return one_repo_at_a_time(row)
        except KeyboardInterrupt:
            skip=True
            return skip_repos(row)

def skip_repos(row):
    return row


def find_all(path,name):
    result = []
    for root, dirs, files in os.walk(path):
        if name in files:
#            print("Root=%s Dirs=%s File=%s"%(root,dirs,name))
            result.append(os.path.join(root, name))
    return result

def one_repo_at_a_time(row):
    global expertInitials
    row['expert'] = expertInitials
    path = REPO_PATH + row["Code"].replace('/', '--')
    print("### Processing ",row["Code"].replace('/', '--')," ###")
    code_name=row["Code"].replace('/', '--')
    if pd.isna(row['usedHash']):
        print ("Missing hash, testing scripts")

    try:
        # if there is a hash AND
        # if there is already a script associated, or if there are build files ...
        if not (pd.isna(row['usedHash'])) and (not (pd.isna(row['build_script']) ) or os.path.isfile(SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".sh") or os.path.isfile(SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".fail.sh")):
            if row['build_script'] == "autofail.sh":
                customScriptFile= SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".sh"
                #print("Checking file "+customScriptFile)
                # if this is an autofail, and there is a custom file for that code, replace the autofail with the custom file
                if os.path.isfile(customScriptFile):
                    print(" -> Build script replaced with detected script file:"+"CI/"+row["Code"].replace('/', '--')+".sh")
                    row['build_script']="CI/"+row["Code"].replace('/', '--')+".sh"
                    row['note'] = "TODO:TestScript"
                else:
                    # if there is a custom *.fail.sh then replace the fail with a confirmed fail
                    if os.path.isfile(SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".fail.sh"):
                        row['build_script']="CI/"+row["Code"].replace('/', '--')+".fail.sh"
                        row['note'] = "Confirmed Fail"
                    else:
                        print(" -> Build script automatically derived from previous fail")
            else:
                # if there is a custom build script, insert it in the table
                customScriptFile= SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".sh"
                if os.path.isfile(customScriptFile):
                    print(" -> Build script replaced with detected script file:"+"CI/"+row["Code"].replace('/', '--')+".sh")
                    row['build_script']="CI/"+row["Code"].replace('/', '--')+".sh"
                    row['note'] = "User script"
                else:
                    if os.path.isfile(SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".fail.sh"):
                        row['build_script']="CI/"+row["Code"].replace('/', '--')+".fail.sh"
                        row['note'] = "Confirmed Fail"
                    else:
                        if pd.isna(row['build_script']):
                            print("this should not happen, empty build script file")
                            row['build_script']="autofail.sh"
                            row['note'] = "Critical error, there should be a script file"
                        else:
                            # Not an autofail, no custom script
                            print (" -> Build script already discovered for "+row["Code"].replace('/', '--'),": ",row['build_script'])
            # already found out the build script
            return row
    except KeyError:
        print ("KeyError: build_script or note unknown")

    print ("\t* Downloading ",row["Code"]," to ",REPO_PATH+row["Code"].replace('/', '--'))
    try:
        row['usedHash'] = apply_dowload_repo(row)
    except RepoUnavailable as e:
        print("Repository ",row["Code"]," was deleted, HTTPS code was ",e.getCode())
        return 
        pass
    except Exception as e:
        print(e)
        raise
    print("\t* Download completed")
    if not (pd.isna(row['build_script']) ):
        print("Updated hash, testing existing build script :",row['build_script'])
        # there is a custom build script and it is not a FAIL script, test it:
        if try_build_script(path, BASE_PATH+"/scripts/"+row['build_script']):
            #still works
            print("Added hash and build works")
        else:
            row['build_script']="userscript_fail_after_fixing_githash.sh"
        shutil.rmtree(path)
        return row
    print("\t* Checking for csv defined script file")
    script_file=SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".sh"
    if os.path.isfile(script_file):
        if try_build_script(path,script_file):
            print("Added hash and build works")
            print(script_file)
            row['build_script']=SCRIPT_PATH.split("/scripts/", 1)[-1] + "/" + row["Code"].replace("/", "--") + ".sh"
        else:
            row['build_script']="userscript_fail_after_fixing_githash.sh"
        shutil.rmtree(path)
        return row
    
    print("\t* Checking for existing \"fail\"-script file")
    script_file=SCRIPT_PATH+"/"+row["Code"].replace('/', '--')+".fail.sh"
    if os.path.isfile(script_file):
        print("\t * %s marked as unbuildable"%code_name)
        row['build_script']=script_file
        shutil.rmtree(path)
        return row

    print("\t* checking for possible script match \"%s\""%(code_name+".sh"))
    possible_scripts=find_all(SCRIPT_PATH,code_name+".sh")
    print("\t\t found %s scripts"%(len(possible_scripts)))
    for possible_script in possible_scripts:
        if len(possible_scripts) and  os.path.isfile(possible_scripts[0]):
            relativePath=possible_scripts[0].removeprefix(SCRIPT_PATH)
            print("\t\t testing %s",relativePath)
            if try_build_script(path,possible_script):
                print("build with %s works",possible_script)
                row['build_script']=script_file
                shutil.rmtree(path)
                return row
            else:
                print("\t\t %s did not work..."%(possible_script))

    print("\t* Testing Makefile")
 #   print("Downloaded repo with hash",row['usedHash'])
#    print ("##### Attempting compile for ",row["Code"].replace('/', '--'),"###########")
#    print("Searching for makefiles in %s"%path) 
#    possible_makefiles=find_all(path,"makefile")+find_all(path,"Makefile")
#    print("\t\t found %s makefiles"%(len(possible_makefiles)))
#    for makefile in possible_makefiles:
    if "Makefile" in os.listdir(path) or "makefile" in os.listdir(path):
        print("\t\tMakfile in ",path)
        print("\t\tMakefile execution templated:",SCRIPT_PATH+"/default_make.sh")
        if try_build_script(path, SCRIPT_PATH + "/default_make.sh"):
            row['build_script'] = "default_make.sh"
            row['use_configure'] = False
            row['note']="Autobuild Success"
            print (" -> Makefile successfull for ",row["Code"].replace('/', '--'))
            
            shutil.rmtree(path)
            return row
        else:
            print("\t* Makefile failed") 
    else:
        print("\t* Makefile not available")
    print("\t* Testing CMake")
    if "CMakeLists.txt" in os.listdir(path):
        print("cmake in ",path)
        if try_build_script(path, SCRIPT_PATH+"/default_cmake.sh"):
            row['build_script'] = "default_cmake.sh"
            row['use_configure'] = False
            row['note']="Autobuild Success"
            print (" -> cmake successfull for ",row["Code"].replace('/', '--'))
            shutil.rmtree(path)
            return row       
        else:
            print("\t* CMake failed") 
    else:
        print("\t* Cmake not available")
    if "configure" in os.listdir(path):
        #print("Configure in ",path)
        if try_build_script(path, SCRIPT_PATH+"/default_configure.sh"):
            row['build_script'] = "default_configure.sh"
            row['use_configure'] = False
            row['note']="Autobuild Success"
            print (" -> configure & makefile successfull for ",row["Code"].replace('/'))
            shutil.rmtree(path)
            return row
        else:
            print("\t* configure failed") 
    else:
        print("\t* configure not available")
    # save storage space
    print (" -> TODO: autobuild failed for ",row["Code"].replace('/', '--'),"; provide scriptfile \".sh\"")
    row['note']="Autobuild Fail"
    row['build_script']="autofail.sh"
    # Keep the repo for a manual build attempt
    return row
    pass
#    return row


def try_build_script(path, script):
    assert os.path.isfile(script)
    try:
        print("\t\t calling \"%s %s -O0"%(script,path))
        print("- Build start ------------------------------------------------------------------------")
        output = subprocess.check_output("%s %s -O0"%(script,path), cwd=path,
                                         stderr=subprocess.STDOUT,
                                         shell=True, encoding='UTF-8')
        print("- Build end   -----------------------------------------------------------------------")
        print((script,path))
        print(output)
        if "BUILD SUCCESSFUL" in output:
            return True
        else:
            return False

    except subprocess.CalledProcessError as e:
        print("- Build failed -----------------------------------------------------------------------")
        print("ERROR: building Repo:")
        print(e.output)
    return False


if __name__ == '__main__':
#    parser = argparse.ArgumentParser(
#        prog='downloader',
#        description='Required parameters: --parameters-file, --rules-file, --clusters-file and some job definition.',
#        argument_default=argparse.SUPPRESS
#   )
#    parser.add_argument('--args', help=argparse.SUPPRESS, action='store_true')
#
#
    main()
