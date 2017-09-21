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
import lte.corenetwork.nodes.eNB_multigtp3;
import lte.world.radio.LteChannelControl;
import lte.epc.PgwStandardSimplified2;
import lte.corenetwork.binder.PgwBinder2;


network Bigger_Topology2
{
    parameters:
        int numUe = default(1);
        int localport = default(31);
        @display("i=block/network2;bgb=3519.065,1912.405;bgi=background/budapest");
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
            @display("p=182.83125,74.625;is=n;i=device/server");
        }
        router: Router {
            @display("p=292.28125,93.28125;i=device/smallrouter");
        }
        pgw: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=351.505,391.7375;is=l");
        }
        eNodeB: eNB_multigtp3 {
            @display("p=417.1475,1018.5175;is=vl");
        }

        pgw2: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=751.7125,391.7375;is=l");
        }
        router1: Router {
            @display("p=876.645,563.255");
        }
        pgwbinder2: PgwBinder2 {
            @display("p=49.75,225.11874;is=s");
        }
        pgw1: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=542.08,391.7375;is=l");
        }
        eNodeB1: eNB_multigtp3 {
            @display("p=764.4175,1018.5175;is=vl");
        }
        eNodeB2: eNB_multigtp3 {
            @display("p=1039.6925,1018.5175;is=vl");
        }
        eNodeB3: eNB_multigtp3 {
            @display("p=1266.265,1035.4575;is=vl");
        }
        eNodeB4: eNB_multigtp3 {
            @display("p=1603.6625,983.18;is=vl");
        }
        eNodeB5: eNB_multigtp3 {
            @display("p=1915.4025,803.33;is=vl");
        }
        ue00: Ue {
            @display("p=330.33,1073.5725");
        }
        ue01: Ue {
            @display("p=353.70502,1339.8826");
        }

        ue10: Ue {
            @display("p=608.4925,1034.1375");
        }
        ue11: Ue {
            @display("p=641.465,1312.905");
        }
        ue20: Ue {
            @display("p=330.33,1073.5725");
        }
        ue21: Ue {
            @display("p=330.33,1073.5725");
        }

        ue30: Ue {
            @display("p=1163.03,1339.8826");
        }
        ue31: Ue {
            @display("p=1363.8625,1315.9025");
        }
        ue40: Ue {
            @display("p=1603.6625,1294.92");
        }
        ue41: Ue {
            @display("p=1834.47,1222.98");
        }
        ue50: Ue {
            @display("p=2212.155,926.22754");
        }
        ue51: Ue {
            @display("p=2050.29,1106.0775");
        }
    connections:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        router1.pppg++ <--> Eth10G <--> eNodeB.ppp;
        router1.pppg++ <--> Eth10G <--> pgw.pppg++;
        router1.pppg++ <--> Eth10G <--> pgw2.pppg++;
        pgw2.filterGate <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> pgw1.filterGate;
        router1.pppg++ <--> Eth10G <--> pgw1.pppg++;
        router1.pppg++ <--> Eth10G <--> eNodeB1.ppp;
        eNodeB2.ppp <--> Eth10G <--> router1.pppg++;
        eNodeB3.ppp <--> Eth10G <--> router1.pppg++;
        eNodeB5.ppp <--> Eth10G <--> router1.pppg++;
        eNodeB4.ppp <--> Eth10G <--> router1.pppg++;
}
