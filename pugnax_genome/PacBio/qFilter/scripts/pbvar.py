import os, sys, numpy
from pbcore.io import BasH5Reader

def getSubreads(h5, seqZmws):
    
    for zmw in seqZmws:
        Zmw = h5[zmw]
        subreads = Zmw.subreads
        number_subreads = len(subreads)
        for iread in range(number_subreads):
            subread = subreads[iread]
            yield subread

flush = 1000
path = "/fastdata/bo1mesx"
h5files = [os.path.join(path, line.rstrip()) for line in sys.stdin]
maxlength = 50000

fcount = 0
for h5path in h5files:
    N = numpy.zeros(maxlength)
    Mean = numpy.zeros(maxlength)
    M2 = numpy.zeros(maxlength)
    try:
        n = numpy.zeros(maxlength)
        mean = numpy.zeros(maxlength)
        m2 = numpy.zeros(maxlength)
        
        h5 = BasH5Reader(h5path)
        seqZmws = h5.sequencingZmws
        subreads = getSubreads(h5, seqZmws)
        for subread in subreads:
            QV = subread.QualityValue()
            readlength = len(QV)
            n[: readlength - 1] += 1
            delta = QV[: readlength - 1] - mean[: readlength - 1]
            mean[: readlength - 1] += delta / n[: readlength - 1]
            m2[: readlength - 1] += delta * (QV[: readlength - 1] - mean[: readlength - 1])
            
            N[: readlength - 1] += 1
            Mean[: readlength - 1] += delta / n[: readlength - 1]
            M2[: readlength - 1] += delta * (QV[: readlength - 1] - mean[: readlength - 1])
            
        var = m2 / (n - 1)
        for l in range(maxlength):
            print l + 1, h5path, n[l], mean[l], var[l]
            
            fcount += 1
            if fcount % flush == 0:
                sys.stdout.flush()
            
    except IOError:
        pass

Var = M2 / (N - 1)

for m in range(maxlength):
    print m + 1, 'All', N[m], Mean[m], Var[m]

