import sys
import time
import numpy as np
import pandas as pd
np.random.seed(108)
# mean
def test1(N, W):
  for n in N:
    n = int(n)
    x = pd.Series(np.random.normal(0,1,n))
    for w in W:
      w = int(w)
      t = time.time()
      ans = x.rolling(w).mean()
      t = time.time() - t
      sys.stdout.write('pandas,mean,single,{},{},{:.3f}\n'.format(n, w, t))
      sys.stdout.flush()

def test4(N, W):
  for n in N:
    n = int(n)
    x = pd.DataFrame({'V1' : np.random.normal(0,1,n), 'V2' : np.random.normal(0,1,n)})
    for w in W:
      w = int(w)
      w1 = w-10
      w2 = w+10
      t = time.time()
      ans = [x.rolling(w1).mean().reset_index(drop=True), x.rolling(w2).mean().reset_index(drop=True)]
      t = time.time() - t
      sys.stdout.write('pandas,mean,quadruple,{},{},{:.3f}\n'.format(n, w, t))
      sys.stdout.flush()

test1(N = [1e6, 1e7, 1e8], W = [1e2, 1e3, 1e4])
test4(N = [1e6, 1e7, 1e8], W = [1e2, 1e3, 1e4])
# median
def test1(N, W):
  for n in N:
    n = int(n)
    x = pd.Series(np.random.normal(0,1,n))
    for w in W:
      w = int(w)
      t = time.time()
      ans = x.rolling(w).median()
      t = time.time() - t
      sys.stdout.write('pandas,median,single,{},{},{:.3f}\n'.format(n, w, t))
      sys.stdout.flush()

def test4(N, W):
  for n in N:
    n = int(n)
    x = pd.DataFrame({'V1' : np.random.normal(0,1,n), 'V2' : np.random.normal(0,1,n)})
    for w in W:
      w = int(w)
      w1 = w-10
      w2 = w+10
      t = time.time()
      ans = [x.rolling(w1).median().reset_index(drop=True), x.rolling(w2).median().reset_index(drop=True)]
      t = time.time() - t
      sys.stdout.write('pandas,median,quadruple,{},{},{:.3f}\n'.format(n, w, t))
      sys.stdout.flush()

test1(N = [1e6, 1e7, 1e8], W = [1e2, 1e3, 1e4])
test4(N = [1e6, 1e7, 1e8], W = [1e2, 1e3, 1e4])

exit(0)
