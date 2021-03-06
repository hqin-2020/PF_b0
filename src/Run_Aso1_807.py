import numpy as np
import scipy as sp
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import time
from tqdm import tqdm
import pickle
import os
import multiprocessing

from PF_Aso1_0 import *
if __name__ == '__main__':

    workdir = os.path.dirname(os.getcwd())
    srcdir = os.getcwd()
    datadir = workdir + '/data/'
    outputdir = workdir + '/output/'

    seed = 7

    obs_series = pd.read_csv(datadir + 'data.csv', delimiter=',')
    obs_series = np.array(obs_series.iloc[:,1:]).T

    T = obs_series.shape[1]
    N = 80_000
    Λ_scale = 1
    cd_scale = 1

    D_0 = obs_series[:,[0]]
    θXHν_0 = []
    for i in range(N):
        θXHν_0.append(init(D_0, Λ_scale, cd_scale))
        
    particle_series = [θXHν_0]
    particle_TEMP_series = [θXHν_0]
    w_series = [np.ones(N)/N]
    count_series = [np.ones(N)]

    start_time = time.time()
    for t in tqdm(range(T-1)):
        
        D_t_next = obs_series[:,[t+1]]
        input_t = [[particle_series[-1][i][1], particle_series[-1][i][2], D_t_next, seed+t+i] for i in range(N)]
            
        pool = multiprocessing.Pool()
        output_t = pool.map(update_θXHν, input_t)      
        particle_TEMP_series.append(output_t)
        
        ν_t = [i[3] for i in output_t]
        w_t_next = ν_t/np.sum(ν_t)
        try:
            count_all = sp.stats.multinomial.rvs(N, w_t_next)
        except:
            for i in range(N):
                if w_t_next[i]>(np.sum(w_t_next[:-1]) - 1):
                    w_t_next[i] = w_t_next[i] - (np.sum(w_t_next[:-1]) - 1)
                    break
            count_all = sp.stats.multinomial.rvs(N, w_t_next)
        count_series.append(count_all)
        w_series.append(w_t_next)
        particle_t_next = []
        for i in range(N):
            if count_all[i] != 0:
                for n in range(count_all[i]):
                    particle_t_next.append(output_t[i])    
        particle_series.append(particle_t_next)
    run_time = time.time() - start_time
    print(run_time)

    start_time = time.time()
    case = 'seed = ' + str(seed) + ', T = ' + str(T) + ', N = ' + str(N) + ', Λ_scale = ' + str(Λ_scale) + ', cd_scale = ' + str(cd_scale)
    try: 
        casedir = outputdir + case  + '/'
        os.mkdir(casedir)
    except:
        casedir = outputdir + case  + '/'

    for t in tqdm(range(T)):
        with open(casedir + 'particle_TEMP_series_'+str(t)+'.pkl', 'wb') as f:
            pickle.dump(particle_TEMP_series[t], f)
        with open(casedir + 'count_series_'+str(t)+'.pkl', 'wb') as f:
            pickle.dump(count_series[t], f)
        with open(casedir + 'particle_series_'+str(t)+'.pkl', 'wb') as f:
            pickle.dump(particle_series[t], f)
        with open(casedir + 'w_series_'+str(t)+'.pkl', 'wb') as f:
            pickle.dump(w_series[t], f)
    run_time = time.time() - start_time
    print(run_time)