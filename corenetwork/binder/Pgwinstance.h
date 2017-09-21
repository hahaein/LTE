#ifndef _LTE_PGWINSTANCE_H_
#define _LTE_PGWINSTANCE_H_

#include <omnetpp.h>
#include <string>
#include "common/LteCommon.h"
#include "inet/networklayer/contract/ipv4/IPv4Address.h"
#include "inet/networklayer/common/L3Address.h"
#include "common/LteCommon.h"
#include "corenetwork/binder/LteBinder.h"

using namespace inet;


class Pgw
{
private:
    char* PGW;
    int numUE;
    MacNodeId UE[10];
    LteBinder* binder;
    L3Address srcUE[10];
    int end=0;
    friend class PgwBinder2;
public:

    Pgw(char* PGW):numUE(0)
{
        int len=strlen(PGW)+1;
        this->PGW=new char[len];
        strcpy(this->PGW,PGW);
        binder=getBinder();
        EV<<"Successfully registered";
}

    //const char* getnameofPGW(MacNodeId pgwID);
    const char* getPGWname();
    int getnumUE();
    void setmacNodeIDofUE(MacNodeId ue);
    MacNodeId getmacNodeIDofUE();
    void setsrcUE(L3Address address);
};


#endif
