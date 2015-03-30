import os, sys, numpy
from pbcore.io import BasH5Reader

def getSubreads(h5, seqZmws):
    
    for zmw in seqZmws:
        Zmw = h5[zmw]
        subreads = Zmw.subreads
        zmwReadScore = Zmw.readScore
        number_subreads = len(subreads)
        for iread in range(number_subreads):
            subread = subreads[iread]
            yield subread, zmwReadScore

flush = 1000
path = "/fastdata/bo1mesx"
h5files = [os.path.join(path, line.rstrip()) for line in sys.stdin]

header = ["h5path", "subReadName", "readScore", "lenbc", "c6", "c8", "c10", "c12"]

print ' '.join(header)

fcount = 0
for h5path in h5files:
    try:
        h5 = BasH5Reader(h5path)
        seqZmws = h5.sequencingZmws
        subreads = getSubreads(h5, seqZmws)
        for subread, readScore in subreads:
            subReadName = subread.readName
            
            QV = subread.QualityValue()
            c6 =  numpy.count_nonzero(QV > 6)
            c8 = numpy.count_nonzero(QV > 8)
            c10 = numpy.count_nonzero(QV > 10)
            c12 = numpy.count_nonzero(QV > 12)
            
            basecalls = subread.basecalls()
            lenbc = len(basecalls)
            
            print h5path, subReadName, readScore, lenbc, c6, c8, c10, c12
            
            fcount += 1
            if fcount % flush == 0:
                sys.stdout.flush()
    except IOError:
        items = len(header) - 1
        print h5path, ' '.join(["NaN"] * items)
        fcount += 1

