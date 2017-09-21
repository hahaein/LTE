//
//                           SimuLTE
//
// This file is part of a software released under the license included in file
// "license.pdf". This license can be also found at http://www.ltesimulator.com/
// The above file and the present reference are part of the software itself,
// and cannot be removed from it.
//

#ifndef _LTE_UESET_H_
#define _LTE_UESET_H_

#include <omnetpp.h>
#include <string>
#include "common/LteCommon.h"
#include "inet/networklayer/common/L3Address.h"
#include "common/LteCommon.h"
#include "corenetwork/binder/LteBinder.h"
using namespace inet;



class ueset: public cSimpleModule
{

private:
    L3Address pgwaddress_;
    bool istrue;
    LteBinder* binder_;
public:
    void initialize(){
        EV<< "Initialize the ueset!!"<<endl;
        MacNodeId masterId= getParentModule()->par("masterId");
        cModule *module=getParentModule();
        binder_=getBinder();
        MacNodeId macId=binder_->registerNode(module, UE, masterId);
        binder_->setMacNodeId(address, macId);
    };
    L3Address getpgwaddress(){
        return pgwaddress_;
    };
    void setpgwaddress(L3Address pgwaddress){
        pgwaddress_=pgwaddress;
        istrue=true;

    };
   bool isaddress(){
       return istrue;
   }

};

Define_Module(ueset);
#endif
