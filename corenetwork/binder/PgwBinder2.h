//
//                           SimuLTE
//
// This file is part of a software released under the license included in file
// "license.pdf". This license can be also found at http://www.ltesimulator.com/
// The above file and the present reference are part of the software itself,
// and cannot be removed from it.
//

#ifndef _LTE_LTEPGWBINDER2_H_
#define _LTE_LTEPGWBINDER2_H_

#include <omnetpp.h>
#include <string>
#include "common/LteCommon.h"
#include "inet/networklayer/contract/ipv4/IPv4Address.h"
#include "inet/networklayer/common/L3Address.h"
#include "corenetwork/binder/Pgwinstance.h"
#include "corenetwork/binder/LteBinder.h"
#include "inet/networklayer/contract/ipv4/IPv4ControlInfo.h"

using namespace inet;



class PgwBinder2 : public cSimpleModule
{
  private:
      Pgw* pgwlist[10];
      int numPGW;
      LteBinder *binder;

  public:
      PgwBinder2(): numPGW(0){}
         ~PgwBinder2()
         {
             for(int i=0;i<numPGW;i++)
             {
                 delete pgwlist[i];
             }
         }

    virtual void initialize(int stages){
    binder=getBinder();
    }

    virtual void handleMessage(cMessage *msg)
    {
    }

  public:

    L3Address getPgwAddress();
    L3Address assignPgwAddress();
    L3Address assignPgwAddress(IPv4Datagram *  address);
    void registerPGW(char* name);
    int findPGWwithMinUE();

};


#endif



