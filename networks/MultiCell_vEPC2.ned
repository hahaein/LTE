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
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import lte.corenetwork.binder.LteBinder;
import lte.corenetwork.nodes.Ue;
import lte.corenetwork.nodes.eNodeB;
import lte.corenetwork.nodes.ExtCell;
import lte.epc.PgwStandardSimplified;
import lte.world.radio.LteChannelControl;


network MultiCell_vEPC2
{
    parameters:

        int numUE1 = default(1);
        int numUE2 = default(1);
        @display("i=block/network2;bgb=1098.2312,651.725;bgi=background/budapest");
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
            @display("p=172.88126,59.7;is=vs;i=device/server");
        }
        pgw: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=172,287;is=vs");
        }
        router: Router {
            @display("p=179.1,143.03125;i=device/smallrouter;is=s");
        }
        eNodeB1: eNodeB {
            @display("p=553.755,252.0825;is=l");
        }
        eNodeB2: eNodeB {
            @display("p=553.755,141.8825;is=l");
        }
        ue1[numUE1]: Ue {
            @display("p=583.3187,410.4375");
        }

        ue2[numUE2]: Ue {
            @display("p=789,280");
        }

        eNodeB3: eNodeB {
            @display("p=371.92502,555.1325;is=l");
        }
        pgw1: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=138.05624,499.9875;is=s");
        }
        eNodeB4: eNodeB {
            @display("p=381.5675,442.1775;is=l");
        }
        router1: Router {
            @display("p=418.76,115.71");
        }
    connections:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        router1.pppg++ <--> Eth10G <--> eNodeB1.ppp;
        router1.pppg++ <--> Eth10G <--> eNodeB2.ppp;

        //# X2 connections
        eNodeB1.x2++ <--> Eth10G <--> eNodeB2.x2++;
        pgw1.pppg++ <--> Eth10G <--> eNodeB3.ppp;
        pgw1.pppg++ <--> Eth10G <--> eNodeB4.ppp;

        //# X2 connections
        eNodeB3.x2++ <--> Eth10G <--> eNodeB4.x2++;
        router.pppg++ <--> Eth10G <--> pgw1.filterGate;
        router1.pppg++ <--> Eth10G <--> pgw.pppg++;
}
