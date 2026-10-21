import numpy as np
import matplotlib.pyplot as plt
from CGMFtk import histories as fh

# also define some plotting features
import matplotlib as mpl
mpl.rcParams['font.size'] = 12
mpl.rcParams['font.family'] = 'Helvetica','serif'
mpl.rcParams['font.weight'] = 'normal'
mpl.rcParams['axes.labelsize'] = 18.
mpl.rcParams['xtick.labelsize'] = 18.
mpl.rcParams['ytick.labelsize'] = 18.
mpl.rcParams['lines.linewidth'] = 2.
mpl.rcParams['xtick.major.pad'] = '10'
mpl.rcParams['ytick.major.pad'] = '10'
mpl.rcParams['image.cmap'] = 'BuPu'

# define a working directory where the history files are stored
workdir = '/Users/wens/MC_Program/CGMF/my-test/' #历史文件所在目录
histFile = 'histories.cgmf.0'
hist = fh.Histories(workdir + histFile)

# print the number of events in the file
print ('This file contains ',str(hist.getNumberEvents()),' events and ',str(hist.getNumberFragments()),' fission fragments')

# provide a summary table of the fission events
table = hist.summaryTable()
for row in table:
    print(row)

# plot the distributions of the fission fragments
A = hist.getA() # get A of all fragments
AL = hist.getALF() # get A of light fragments
AH = hist.getAHF() # get A of heavy fragments
fig = plt.figure(figsize=(8,6))
bins = np.arange(min(A),max(A))
h,b = np.histogram(A,bins=bins,density=True)
plt.plot(b[:-1],h,'-o')
plt.xlabel('Mass (A)')
plt.ylabel('Frequency')
plt.show()

Z = hist.getZ()
ZL = hist.getZLF()
ZH = hist.getZHF()
fig = plt.figure(figsize=(8,6))
bins = np.arange(min(Z),max(Z))
h,b = np.histogram(Z,bins=bins,density=True)
plt.plot(b[:-1],h,'-o')
plt.xlabel('Charge (Z)')
plt.ylabel('Frequency')
plt.show()

fig = plt.figure(figsize=(8,6))
TKEpre = hist.getTKEpre() # TKE before neutron emission
TKEpost = hist.getTKEpost() # TKE after neutron emission
bins = np.arange(min(TKEpre),max(TKEpre))
h,b = np.histogram(TKEpre,bins=bins,density=True)
plt.plot(0.5*(b[:-1]+b[1:]),h,'-o',label='Before neutron emission')
bins = np.arange(min(TKEpost),max(TKEpost))
h,b = np.histogram(TKEpost,bins=bins,density=True)
plt.plot(0.5*(b[:-1]+b[1:]),h,'-o',label='After neutron emission')
plt.legend()
plt.xlabel('Total Kinetic Energy (MeV)')
plt.ylabel('Frequency')
plt.show()