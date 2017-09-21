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
import lte.corenetwork.nodes.new_eNB;
import lte.world.radio.LteChannelControl;
import lte.epc.PgwStandardSimplified;


network withrouter2eNB
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
            @display("p=453.96875,146.7625;is=l");
        }
        eNodeB2: new_eNB {
            @display("p=629.3375,463.91873;is=vl");
        }
        ue2[numUe]: Ue {
            @display("p=702.71875,337.05624");
        }
        router1: Router {
            @display("p=448.99374,281.0875");
        }
        eNodeB1: new_eNB {
            @display("p=310.9375,463.91873;is=vl");
        }
        ue1[numUe]: Ue {
            @display("p=195.26875,344.51874");
        }
    connections:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        router1.pppg++ <--> Eth10G <--> eNodeB2.ppp;
        router1.pppg++ <--> Eth10G <--> pgw.pppg++;
        eNodeB1.ppp <--> router1.pppg++;
}
