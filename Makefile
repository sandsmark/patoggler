CCFILES=$(wildcard *.cc)
CXXFLAGS += -g -fPIC -std=c++2a -O1 -Wall -Wextra -pedantic
OBJECTS=$(patsubst %.cc, %.o, $(CCFILES))
LDFLAGS=-lpulse -lsystemd -ludev -g

#CXXFLAGS += -fsanitize=undefined -fsanitize=address
#LDFLAGS += -fsanitize=undefined -fsanitize=address

patoggler: $(OBJECTS)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cc
	$(CXX) -MMD -MP $(CXXFLAGS) -o $@ -c $<

DEPS=$(OBJECTS:.o=.d)
-include $(DEPS)

clean:
	rm -f patoggler $(OBJECTS) $(DEPS)
