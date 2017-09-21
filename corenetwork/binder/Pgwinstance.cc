
#include <omnetpp.h>
#include <string>
#include "common/LteCommon.h"
#include "inet/networklayer/contract/ipv4/IPv4Address.h"
#include "inet/networklayer/common/L3Address.h"
#include "common/LteCommon.h"
#include "corenetwork/binder/LteBinder.h"
#include "corenetwork/binder/Pgwinstance.h"

using namespace inet;

const char* Pgw::getPGWname(){
    return PGW;
}
int Pgw::getnumUE()
{
    return numUE;
}

void Pgw::setmacNodeIDofUE(MacNodeId ue)
{
    static int i=0;
    UE[i++]=ue;

}
MacNodeId Pgw::getmacNodeIDofUE()
{
    for(int j=0;j<numUE;j++)
    {
        EV<< "connected UE is "<< UE[j]<<endl;
    }

    return 0;
}

void Pgw::setsrcUE(L3Address address){
    srcUE[end++]=address;
}
