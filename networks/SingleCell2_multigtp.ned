// 
//                           SimuLTE
// 
// This file is part of a software released under the license included in file
// "license.pdf". This license can be also found at http://www.ltesimulator.com/
// The above file and the present reference are part of the software itself, 
// and cannot be removed from it.
// 
package lte.simulations.networks;

import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.ethernet.Eth10G;
import inet.node.ethernet.Eth10M;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import lte.corenetwork.binder.LteBinder;
import lte.corenetwork.nodes.Ue;
import lte.corenetwork.nodes.eNB_multigtp;
import lte.world.radio.LteChannelControl;
import lte.epc.PgwStandardSimplified;


network SingleCell2
{
    parameters:
        int numUe = default(1);
        @display("i=block/network2;bgb=991,558;bgi=background/budapest");
    submodules:
        channelControl: LteChannelControl {
            @display("p=50,25;is=s");
        }
        routingRecorder: RoutingTableRecorder {
            @display("p=50,75;is=s");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=50,125");
            config = xmldoc("demo.xml");
        }
        binder: LteBinder {
            @display("p=50,175;is=s");
        }
        server: StandardHost {
            @display("p=212,118;is=n;i=device/server");
        }
        router: Router {
            @display("p=321,136;i=device/smallrouter");
        }
        pgw: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=401.73123,216.41249;is=l");
        }
        eNodeB: eNB_multigtp {
            @display("p=386.80624,407.94998;is=vl");
        }
        ue[numUe]: Ue {
            @display("p=783,278");
        }
        pgw2: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=577.1,208.95;is=l");
        }
        router1: Router {
            @display("p=508.69376,314.66876");
        }
    connections:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        router1.pppg++ <--> Eth10G <--> eNodeB.ppp;
        router1.pppg++ <--> Eth10G <-->  pgw.pppg++;
        router1.pppg++ <-->  Eth10G <--> pgw2.pppg++;
        pgw2.filterGate <-->  Eth10G <--> router.pppg++;
}
