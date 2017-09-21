

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


network PGWBinder_ver3
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
            @display("p=369.39374,277.35626;is=l");
        }
        pgw2: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=567.15,277.35626;is=l");
        }
        ue1[numUe]: Ue {
            @display("p=237.55624,532.325");
        }
        ue2[numUe]: Ue {
            @display("p=892.50995,506.59998");
        }
        eNodeB1: new_eNB {
            @display("p=347.00626,609.4375;is=vl");
        }
        eNodeB2: new_eNB2 {
            @display("p=523.6188,594.5125;is=vl");
        }
        router2: Router {
            @display("p=573.64996,135.59;i=device/smallrouter");
        }
        server1: StandardHost {
            @display("p=573.64996,53.64;is=n;i=device/server");
        }
    connections:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        pgw2.filterGate <--> Eth10G <--> router2.pppg++;
        router2.pppg++ <--> Eth10G <--> server1.pppg++;
        eNodeB1.ppp <--> Eth10G <--> pgw.pppg++;
        pgw2.pppg++ <--> Eth10G <--> eNodeB2.ppp;
}
