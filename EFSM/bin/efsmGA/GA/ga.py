# encoding:UTF-8
from __future__ import division
from datetime import datetime
import feasibility
import pop_diversity
import du_cover

import copy
from collections import Counter

import random

popsize = 60
pc = 0.9
pm = 0.3


def GA(pop, pc, pm, popsize):
    print 'parent pop:', pop
    # list0 = feasibility.is_feasible_list(pop)
    # print 'parentpop feasibility:', list0
    # parentpopcov=cal_chrofitness.pop_coverage(pop)
    # print 'population covered number:', parentpopcov

    temp = copy.deepcopy(pop)

    covlist = cal_chrofitness.pop_fitlist_cov(pop)
    # print 'cov of everychro:', covlist

    # 验证 select功能
    selectedpop = selection.RouletteSelection(pop)
    # print 'select result:', selectedpop

    # 验证crossover功能
    crossedpop = crossover.crossover(selectedpop, pc)
    # print "crossedpop"+str(crossedpop)
    # print 'crossover result:', crossedpop

    # 验证mutant功能
    mutantedpop = mutation.mutantion(crossedpop, pm)
    # print 'mutant result:', mutantedpop

    # mut_fit = cal_chrofitness.pop_fitlist_cov(mutantedpop)
    # print 'mutant fit:', mut_fit

    # 验证删除子代中不可行path
    # childpop_fealible=feasibility.del_infeasible_after_mutant(mutantedpop)
    # print 'del infeasible path(childpop_feasible):',childpop_fealible
    # print 'fesible删后剩余条数：',len(childpop_fealible)

    # 刪除重复个体
    childpop_repeat = delete_repeat.delete_repeat_chrom(mutantedpop)
    # print 'del repeat path(childpop_no_repeat):',childpop_repeat
    # print 'repeat删后剩余条数：',len(childpop_repeat)

    # 验证update功能
    # newpop = update_population.update_cov(temp,childpop_repeat, popsize)   #单纯以个体cov更新种群
    # newpop = update_population.update_covdiv(temp, childpop_repeat, popsize)   #以cov+div更新
    # newpop=update_population.update_div(temp,childpop_repeat, popsize)  #以div更新
    newpop = update_population.update_deleteSim(temp, childpop_repeat, popsize)  # 更新策略一

    print 'update result:', newpop

    # list=feasibility.is_feasible_list(newpop)
    # print 'newpop feasibility:',list

    new_fit_cov = cal_chrofitness.pop_fitlist_cov(newpop)
    # print 'update cov fit:', new_fit_cov
    # new_fit_div=calulate_fitness.pop_divalue_list(newpop)
    # print 'update div fit:', new_fit_div

    return newpop

import os
import sys
# print sys.argv[1]
file_dir = sys.argv[1].strip()
with open(os.path.join(file_dir, "ga_cfg.ini"), "w+") as f:
    f.writelines([file_dir+"/EFSM.txt"])

import initial_population
import cal_chrofitness
import selection
import crossover
import mutation
import update_population
import delete_repeat
import obtain_efsm_info


startTime = datetime.now()  # 记录开始时间
# pop= initial_population.initialpop_feasible(popsize)  #初始种群生成（保证可行）
# pop=initial_population.initalpop(popsize)  #初始种群生成（不保证可行）
pop = initial_population.initalpop_new(popsize)
count = 0

while 1:
    pop = GA(pop, pc, pm, popsize)
    count = count + 1
    # 输出最优的个体的fitness
    popcov = cal_chrofitness.pop_coverage(pop)
    print 'population covered number:', popcov
    # endTime=datetime.now()
    # during = (endTime - startTime).seconds

    '''if during>3:
        break
    print '==============================================='''

    # timeslist = Counter(new_fit).values()
    # maxtimes = max(timeslist)
    # if maxtimes>7:
    # print '================================================'
    # print 'geneneration:', count
    # break
    if (popcov == len(obtain_efsm_info.obtain_tran_info())) or (count == 10):
        print '================================================'
        print 'geneneration:', count
        # popdiv=pop_diversity.suite_diversity(pop)
        # print 'pop diversity:',popdiv
        # popdiv1 = pop_diversity.suite_diversity_leven(pop)
        # print 'leven diversity:', popdiv1
        with open(os.path.join(file_dir,"generated_path.txt"), 'w+') as f:
            result_list = []
            result_list.append(str(len(pop))+"\n")
            for path in pop:
                tmp_string = ""
                # tmp_string += str(len(path)) + " "
                for tran in path:
                    tmp_string += str(tran) + " "
                tmp_string += "\n"
                result_list.append(tmp_string)
            f.writelines(result_list)
        break
# 一个测试序列集能否发现某特定故障（p-measure）
'''number=0
for i in range(len(pop)):
    print pop[i]
    if ('T9' in pop[i]) and (('T22'in pop[i])or('T23'in pop[i])):
        number = number + 1
print 'find fault times:', number'''

endTime = datetime.now()
during = endTime - startTime
print 'endTime - startTime:\t', during
print '======================================================='

# 对测试序列集乱序10次，每次都找到检测到第一个故障时执行的测试序列个数(f-measure)
'''indexlist=[]
for i in range(10):
    random.shuffle(pop)
    print "随机排序列表 : ", pop
    for i in range(len(pop)):
        #print pop[i]
        if (('T7' in pop[i]) and ('T20' in pop[i])) or (('T8' in pop[i]) and ('T21' in pop[i])) or (('T9' in pop[i]) and (('T22' in pop[i])or('T23' in pop[i]))):
            index=i+1
            print 'the number which find this fault:',index
            indexlist.append(index)
            break
        elif i==len(pop)-1:
            print 'this suite cannot find this fault!'
            indexlist.append(len(pop))
print indexlist
print sum(indexlist)/10'''
'''dulist=[['T1','T2'],  #ATM
['T1','T4'],
['T1','T19'],
['T1','T22'],
['T1','T21'],
['T1','T11'],
['T1','T15'],
['T1','T20'],
['T1','T16'],
['T1','T12'],
['T2','T2'],
['T2','T3'],
['T5','T19'],
['T5','T15'],
['T5','T21'],
['T5','T12'],
['T6','T11'],
['T6','T22'],
['T6','T20'],
['T6','T16'],
['T13','T13'],
['T13','T20'],
['T13','T11'],
['T13','T12'],
['T13','T15'],
['T13','T16'],
['T14','T14'],
['T14','T20'],
['T14','T11'],
['T14','T12'],
['T14','T15'],
['T14', 'T16'],
['T17', 'T17'],
['T17', 'T19'],
['T17', 'T22'],
['T17', 'T21'],
['T18', 'T18'],
['T18', 'T19'],
['T18', 'T22'],
['T18', 'T21']]'''

'''dulist=[['T1','T7'], #cruisecontrol
['T1','T11'],
['T1','T12'],
['T1','T2'],
['T1','T14'],
['T1','T13'],
['T1','T6'],
['T1','T9'],
['T1','T8'],
['T1','T5'],
['T1','T10'],
['T1','T15'],
['T1','T16'],
['T1','T17'],
['T2','T4'],
['T2','T11'],
['T2','T13'],
['T2','T3'],
['T2','T9'],
['T2','T12'],
['T2','T14'],
['T2','T8'],
['T2','T5'],
['T2','T10'],
['T6','T4'],
['T6','T11'],
['T6','T13'],
['T6','T3'],
['T6','T9'],
['T6','T12'],
['T6','T14'],
['T6','T8'],
['T6','T5'],
['T6','T10'],
['T6','T7'],
['T7','T4'],
['T7','T11'],
['T7','T13'],
['T7','T3'],
['T7','T9'],
['T7','T12'],
['T7','T14'],
['T7','T8'],
['T7','T5'],
['T7','T10'],
['T9','T9'],
['T9','T14'],
['T10','T10'],
['T10','T14'],
['T11','T11'],
['T11','T14'],
['T12','T12'],
['T12','T14'],
['T13','T13'],
['T13','T14'],
['T14','T14'],
['T15','T15'],
['T16','T16'],
['T17','T17']]'''

'''dulist=[['T2','T2'],  #simpledphone
['T2','T10'],
['T2','T15'],
['T2','T14'],
['T3','T6'],
['T3','T10'],
['T3','T15'],
['T3','T14'],
['T4','T4'],
['T4','T6'],
['T5','T5'],
['T5','T6'],
['T8','T8'],
['T8','T6'],
['T8','T10'],
['T8','T15'],
['T8','T14'],
['T10','T10'],
['T11','T11'],
['T13','T13'],
['T16','T16'],
['T21','T21'],
['T34','T36'],
['T37','T36'],
['T39','T39'],
['T40','T10'],
['T40','T6'],
['T40','T15'],
['T40','T14']]'''

'''dulist=[['T1','T20'],  #fuelpump
['T1','T17'],
['T1','T21'],
['T1','T18'],
['T1','T22'],
['T1','T23'],
['T1','T19'],
['T7','T20'],
['T8','T21'],
['T9','T22'],
['T9','T23'],
['T17','T24'],
['T18','T24'],
['T19','T24'],
['T20','T24'],
['T21','T24'],
['T22','T24'],
['T23','T24']]'''

'''dulist=[['T4','T4'],  #printok
['T8','T8'],
['T8','T41'],
['T8','T52'],
['T8','T46'],
['T8','T50'],
['T8','T49'],
['T8','T81'],
['T11','T11'],
['T11','T13'],
['T12','T12'],
['T29','T29'],
['T29','T41'],
['T29','T52'],
['T29','T46'],
['T29','T50'],
['T29','T49'],
['T29','T81'],
['T40', 'T40'],
['T40', 'T41'],
['T40', 'T52'],
['T40', 'T46'],
['T40', 'T50'],
['T40', 'T49'],
['T40', 'T81'],
['T47', 'T47'],
['T47', 'T41'],
['T47', 'T52'],
['T47','T46'],
['T47','T50'],
['T47','T49'],
['T47','T81'],
['T54','T54'],
['T67','T67'],
['T77','T77'],
['T88','T88']]'''

'''dulist=[              #cashier
    ['T1','T11'],
    ['T1','T8'],
    ['T1','T3'],
    ['T1','T12'],
    ['T1','T20'],
    ['T1','T14'],
    ['T2','T11'],
    ['T2','T8'],
    ['T2','T3'],
    ['T2','T12'],
    ['T2','T20'],
    ['T2','T14'],
    ['T6','T20'],
    ['T6','T8'],
    ['T6','T21'],
    ['T6','T7'],
    ['T9','T11'],
    ['T9','T15'],
    ['T10','T11'],
    ['T10','T15'],
    ['T12','T14'],
    ['T15','T11'],
    ['T17','T19'],
    ['T19','T8'],
    ['T19','T20'],
    ['T19','T21'],
    ['T19','T7']
]'''

# ducover=du_cover.ducover(dulist,pop)
