
LINK.o = $(LINK.cc)
CXXFLAGS = -std=c++14 -Wall

all: correctness persistence testsForReport

correctness: ssTableCacheCell.o ssTableCache.o ssTableHeader.o bloomFilter.o skipList.o kvstore.o correctness.o

persistence: ssTableCacheCell.o ssTableCache.o ssTableHeader.o bloomFilter.o skipList.o kvstore.o persistence.o

testsForReport: ssTableCacheCell.o ssTableCache.o ssTableHeader.o bloomFilter.o skipList.o kvstore.o testsForReport.o

clean:
	-rm -f correctness persistence testForReport *.o
