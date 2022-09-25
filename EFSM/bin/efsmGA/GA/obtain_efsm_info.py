#encoding:UTF-8

import sys
sys.path.append("..")
sys.path.append("../..")
sys.path.append("../subjects")
import EFSM

# modelfiledir = '../subjects/'
#modelfile = "EFSM_ATM.txt"
#modelfile="EFSM_Cashier.txt"
#modelfile="EFSM_CruiseControl-old.txt"
# modelfile="EFSM.txt"
#modelfile="EFSM_SimplifiedPhone.txt"
#modelfile="EFSM_FuelPump.txt"
# inputfile = modelfiledir + modelfile
import os
import sys
file_dir = sys.argv[1].strip()
with open(os.path.join(file_dir, "ga_cfg.ini"), 'r') as f:
    inputfile = f.readlines()[0].strip()
SM = EFSM.efsmFromFile(inputfile)    #对efsm类实例化



def obtain_tran_info():      #得到某efsm的全部迁移信息（name, src, tgt, event, cond, action）

    #    modelfile="ntscd_example.txt"
    #    modelfile="sm3.txt"
    #    modelfile="fairnessEG.txt"
    #    modelfile="kellysample.txt"

    #    modelfile="EFSM_ATM_noexit.txt"
    #    modelfile="efsm_atm_noexit_temp.txt"
    #    modelfile="EFSM_ATM_noexit_new.txt"
    #    modelfile="EFSM_Cashier.txt"
    #   modelfile="EFSM_Cashier_shortPin.txt"
    #    modelfile="EFSM_Cashier_noexit.txt"
    #    modelfile="EFSM_CruiseControl-new.txt"
    #    modelfile="EFSM_FuelPump.txt"
    #    modelfile="EFSM_FuelPump_noexit.txt"
    #    modelfile="EFSM_INRES.txt"
    #    modelfile="EFSM_INRES_noexit.txt"
    #    modelfile="EFSM_Lift.txt"
    #    modelfile="EFSM_SimplifiedPhone.txt"
    #    modelfile="EFSM_SimplifiedPhone_noexit.txt"
    #    modelfile="EFSM_TCP.txt"
    #    modelfile="EFSM_PrinTok.txt"
    #    modelfile="EFSM_TCSbin.txt"
    #    modelfile="EFSM_TCSbin_EXIT.txt"
    #    modelfile="EFSM_VendingMachine.txt"
    #    modelfile="EFSM_VendingMachine_noexit.txt"
    ##################################################

    #print "%s has %s states and  %s transitions" % (SM.name, len(SM.stateList), len(SM.transitionList))

    return SM.transitionList
    #print SM.transitionList[1].src.name

def tran_number():
    return len(SM.transitionList)


def state_number():
    return len(SM.stateList)

def obtain_end_tranlist():   #得到end transition list
    SM.findEndTransition()
    return SM.endTransitionList

def obtain_start_tranlist():
    SM.findStartTransition()
    return SM.startTransitionList

def obtain_succ():
    SM.initTransitionSuccessor()
    return SM.succDict

def find_subpath(start):   #得到从某tran出发的的有效sub-path
    obtain_tran_info()
    obtain_succ()

    pathlist=SM.findPath(start)
    return pathlist

def find_allpath():
    obtain_start_tranlist()
    obtain_tran_info()
    obtain_succ()

    pathlist = SM.findAllPath()
    return pathlist



if __name__ == '__main__':  # not execute when import as a module
    print "%s has %s states and  %s transitions" % (SM.name, len(SM.stateList), len(SM.transitionList))
    traninfolist=obtain_tran_info()
    print traninfolist
    endtran=obtain_end_tranlist()
    print endtran
    print tran_number()

    #obtain_end_tranlist()
    #obtain_succ()
    #p=find_subpath('T8')
    #print p
    #allpath=find_allpath()
    #print allpath
