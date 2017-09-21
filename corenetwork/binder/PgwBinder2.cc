//
//                           SimuLTE
//
// This file is part of a software released under the license included in file
// "license.pdf". This license can be also found at http://www.ltesimulator.com/
// The above file and the present reference are part of the software itself,
// and cannot be removed from it.
//

#include "corenetwork/binder/PgwBinder2.h"
#include "corenetwork/deployer/LteDeployer.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include <cctype>
#include "corenetwork/nodes/InternetMux.h"
#include "corenetwork/binder/LteBinder.h"
#include "corenetwork/binder/UeSet.h"
#include "inet/networklayer/ipv4/IPv4Datagram.h"
using namespace std;

Define_Module(PgwBinder2);



L3Address PgwBinder2::getPgwAddress(){
    //Enter_Method("getPgwAddress");
    L3Address pgwAddress_;
    pgwAddress_ = L3AddressResolver().resolve("pgw");
    return pgwAddress_;
}

L3Address PgwBinder2::assignPgwAddress(){
    L3Address pgwAddress_;
    int i;
    i=findPGWwithMinUE();
    const char* name=pgwlist[i]->getPGWname();
    pgwlist[i]->numUE++;

    pgwAddress_=L3AddressResolver().resolve(name);

    return pgwAddress_;
}
L3Address PgwBinder2::assignPgwAddress(IPv4Datagram *  address){
    L3Address pgwAddress_;
    int i;
    i=findPGWwithMinUE();
    const char* name=pgwlist[i]->getPGWname();
    pgwlist[i]->numUE++;

    IPv4Address &srcAddr = address->getSrcAddress();
    MacNodeId MacId=binder->getMacNodeId(srcAddr);
    const char* uename=binder->getModuleNameByMacNodeId(MacId);
    ueset* UE=check_and_cast<ueset*>(getSimulation()->getModuleByPath(uename)->getSubmodule("UeSet"));


    pgwAddress_=L3AddressResolver().resolve(name);
    pgwlist[i]->setsrcUE(pgwAddress_);
    UE->setpgwaddress(pgwAddress_);
    return pgwAddress_;
}


void PgwBinder2::registerPGW(char* name)
{
    pgwlist[numPGW++]=new Pgw(name);

}
int PgwBinder2::findPGWwithMinUE()
{
    int temp;
    int min;
    int i;
    for(i=0;i<numPGW;i++)
    {
        if(i==0)
            {
            temp=pgwlist[i]->numUE;
            min=i;
            }
        else if(temp>pgwlist[i]->numUE)
            {
            temp=pgwlist[i]->numUE;
            min=i;
            }
    }
    return min;
}
