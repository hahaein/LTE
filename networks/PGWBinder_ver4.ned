

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
import lte.corenetwork.nodes.new_eNB2;
import lte.corenetwork.nodes.new_eNB3;
import lte.world.radio.LteChannelControl;
import lte.epc.PgwStandardSimplified;


network PGWBinder_ver4
{
    parameters:
        int numUe = default(1);
        @display("i=block/network2;bgb=1180.3187,741.275;bgi=background/budapest");
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
            @display("p=403.78998,65.56;is=n;i=device/server");
        }
        router: Router {
            @display("p=411.24,160.92;i=device/smallrouter");
        }
        pgw: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=461.9,344.18997;is=l");
        }
        ue1[numUe]: Ue {
            @display("p=202.63998,448.49");
        }
        ue2[numUe]: Ue {
            @display("p=902.93994,460.40997");
        }
        eNodeB1: new_eNB {
            @display("p=347.00626,609.4375;is=vl");
        }
        eNodeB2: new_eNB {
            @display("p=581.1,609.41;is=vl");
        }
    connections:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        eNodeB1.ppp <--> Eth10G <--> pgw.pppg++;
        pgw.pppg++ <--> Eth10G <--> eNodeB2.ppp;
}
