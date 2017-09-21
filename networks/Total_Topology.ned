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


network Total_Topology
{
    parameters:
        int numUe = default(1);
        int localport = default(31);
        @display("i=block/network2;bgb=1271.1125,774.85626;bgi=maps/world");
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
            @display("p=582.075,27.3625;is=vs;i=device/server");
        }
        router: Router {
            @display("p=640.53125,74.625;i=device/smallrouter;is=s");
        }
        pgw: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=268.65,329.59375;is=s");
        }
        eNodeB: eNB_multigtp3 {
            @display("p=148.00626,79.6;is=s");
        }
        ue[numUe]: Ue {
            @display("p=124.375,50.993748;is=s");
        }
        pgw2: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=317.15625,350.7375;is=s");
        }
        router1: Router {
            @display("p=359.44376,416.65625;is=s");
        }
        pgwbinder2: PgwBinder2 {
            @display("p=49.75,225.11874;is=s");
        }
        pgw1: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=298.5,282.33124;is=s");
        }
        pgw3: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=351.98126,303.475;is=s");
        }
        pgw4: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=378.1,329.59375;is=s");
        }
        pgw5: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=609.4375,210.19374;is=s");
        }
        pgw6: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=514.9125,274.86874;is=s");
        }
        pgw7: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=651.725,274.86874;is=s");
        }
        pgw8: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=552.225,274.86874;is=s");
        }
        pgw9: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=568.39374,253.72499;is=s");
        }
        pgw10: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=830.825,98.25625;is=s");
        }
        pgw11: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=717.64374,124.375;is=s");
        }
        pgw12: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=884.3062,74.625;is=s");
        }
        pgw13: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=747.4938,74.625;is=s");
        }
        pgw14: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=784.8062,124.375;is=s");
        }
        router2: Router {
            @display("p=589.5375,369.39374;is=s");
        }
        router3: Router {
            @display("p=784.8062,211.4375;is=s");
        }
        pgw16: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=981.3187,369.39374;is=s");
        }
        pgw17: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=955.2,395.51248;is=s");
        }
        pgw20: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=523.6188,210.19374;is=s");
        }
        router4: Router {
            @display("p=926.59375,298.5;is=s");
        }
        pgw21: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=897.9875,405.4625;is=s");
        }
        pgw23: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=870.625,379.34375;is=s");
        }
        pgw24: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=495.01248,238.8;is=s");
        }
        router6: Router {
            @display("p=502.475,98.25625;is=s");
        }
        pgw26: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=568.39374,179.1;is=s");
        }
        pgw27: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=558.4437,211.4375;is=s");
        }
        pgw28: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=473.86874,179.1;is=s");
        }
        pgw29: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=934.0562,350.7375;is=s");
        }
        router7: Router {
            @display("p=634.3125,399.24374");
        }
        eNodeB1: eNB_multigtp3 {
            @display("p=148.00626,253.72499;is=s");
        }
        eNodeB2: eNB_multigtp3 {
            @display("p=148.00626,174.125;is=s");
        }
        ue1[numUe]: Ue {
            @display("p=124.375,225.11874;is=s");
        }
        eNodeB5: eNB_multigtp3 {
            @display("p=513.66876,369.39374;is=s");
        }
        eNodeB6: eNB_multigtp3 {
            @display("p=870.625,185.31876;is=s");
        }
        eNodeB7: eNB_multigtp3 {
            @display("p=427.85,145.51875;is=s");
        }
        eNodeB8: eNB_multigtp3 {
            @display("p=620.6312,160.44376;is=s");
        }
        eNodeB9: eNB_multigtp3 {
            @display("p=669.1375,329.59375;is=s");
        }
        ue5[numUe]: Ue {
            @display("p=398,124.375;is=s");
        }
        ue6[numUe]: Ue {
            @display("p=619.3875,124.375;is=s");
        }
        ue7[numUe]: Ue {
            @display("p=537.3,416.65625;is=s");
        }
        ue8[numUe]: Ue {
            @display("p=926.59375,202.73125;is=s");
        }
        pgw30: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=291.0375,98.25625;is=s");
        }
        pgw31: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=317.15625,98.25625;is=s");
        }
        pgw32: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=254.96875,98.25625;is=s");
        }
        pgw33: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=217.65625,98.25625;is=s");
        }
        router8: Router {
            @display("p=298.5,185.31876;is=s");
        }
        pgw34: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=180.34375,98.25625;is=s");
        }
        router5: Router {
            @display("p=254.96875,47.2625;is=s");
        }
        router9: Router {
            @display("p=327.10626,238.8;is=s");
        }
        router10: Router {
            @display("p=452.725,253.72499;is=s");
        }
        router11: Router {
            @display("p=651.725,225.11874;is=s");
        }
        router12: Router {
            @display("p=696.5,47.2625;is=s");
        }
        router13: Router {
            @display("p=838.2875,467.65;is=s");
        }
        router14: Router {
            @display("p=217.65625,225.11874;is=s");
        }
        router15: Router {
            @display("p=557.2,557.2;is=s");
        }
        pgw15: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=619.3875,608.1937;is=s");
        }
        pgw18: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=593.26874,608.1937;is=s");
        }
        pgw19: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=557.2,608.1937;is=s");
        }
        pgw22: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=519.8875,608.1937;is=s");
        }
        pgw25: PgwStandardSimplified2 {
            nodeType = "PGW";
            @display("p=482.57498,608.1937;is=s");
        }
        router16: Router {
            @display("p=600.73126,695.2562;is=s");
        }
    connections:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router1.pppg++ <--> Eth10G <--> pgw.pppg++;
        router1.pppg++ <--> Eth10G <--> pgw2.pppg++;
        router1.pppg++ <--> pgw1.pppg++;
        router1.pppg++ <--> pgw4.pppg++;
        router1.pppg++ <--> pgw3.pppg++;
        router2.pppg++ <--> pgw6.pppg++;
        router2.pppg++ <--> pgw8.pppg++;
        router2.pppg++ <--> pgw9.pppg++;
        router2.pppg++ <--> pgw5.pppg++;
        router2.pppg++ <--> pgw7.pppg++;
        router3.pppg++ <--> pgw11.pppg++;
        pgw13.pppg++ <--> router3.pppg++;
        pgw14.pppg++ <--> router3.pppg++;
        router3.pppg++ <--> pgw10.pppg++;
        router3.pppg++ <--> pgw12.pppg++;
        router6.pppg++ <--> pgw24.pppg++;
        router6.pppg++ <--> pgw28.pppg++;
        router6.pppg++ <--> pgw20.pppg++;
        router6.pppg++ <--> pgw26.pppg++;
        router6.pppg++ <--> pgw27.pppg++;
        router4.pppg++ <--> pgw23.pppg++;
        pgw21.pppg++ <--> router4.pppg++;
        pgw29.pppg++ <--> router4.pppg++;
        router4.pppg++ <--> pgw17.pppg++;
        router4.pppg++ <--> pgw16.pppg++;
        router8.pppg++ <--> Eth10G <--> pgw34.pppg++;
        router8.pppg++ <--> Eth10G <--> pgw32.pppg++;
        router8.pppg++ <--> pgw33.pppg++;
        router8.pppg++ <--> pgw31.pppg++;
        router8.pppg++ <--> pgw30.pppg++;
        pgw33.filterGate <--> router5.pppg++;
        pgw32.filterGate <--> router5.pppg++;
        pgw30.filterGate <--> router5.pppg++;
        pgw31.filterGate <--> router5.pppg++;
        pgw34.filterGate <--> router5.pppg++;
        pgw11.filterGate <--> router12.pppg++;
        pgw13.filterGate <--> router12.pppg++;
        pgw14.filterGate <--> router12.pppg++;
        pgw10.filterGate <--> router12.pppg++;
        pgw12.filterGate <--> router12.pppg++;
        pgw28.filterGate <--> router10.pppg++;
        pgw24.filterGate <--> router10.pppg++;
        pgw20.filterGate <--> router10.pppg++;
        pgw27.filterGate <--> router10.pppg++;
        pgw26.filterGate <--> router10.pppg++;
        router5.pppg++ <--> router.pppg++;
        router10.pppg++ <--> router.pppg++;
        pgw.filterGate <--> router9.pppg++;
        pgw1.filterGate <--> router9.pppg++;
        pgw3.filterGate <--> router9.pppg++;
        pgw4.filterGate <--> router9.pppg++;
        pgw2.filterGate <--> router9.pppg++;
        router9.pppg++ <--> router.pppg++;
        router12.pppg++ <--> router.pppg++;
        pgw6.filterGate <--> router11.pppg++;
        pgw9.filterGate <--> router11.pppg++;
        pgw7.filterGate <--> router11.pppg++;
        pgw9.pppg++ <--> router11.pppg++;
        pgw5.filterGate <--> router11.pppg++;
        router11.pppg++ <--> router.pppg++;
        pgw23.filterGate <--> router13.pppg++;
        pgw21.filterGate <--> router13.pppg++;
        pgw29.filterGate <--> router13.pppg++;
        pgw17.filterGate <--> router13.pppg++;
        pgw16.filterGate <--> router13.pppg++;
        router13.pppg++ <--> router.pppg++;
        eNodeB.ppp <--> router14.pppg++;
        eNodeB1.ppp <--> router14.pppg++;
        eNodeB2.ppp <--> router14.pppg++;
        router14.pppg++ <--> router8.pppg++;
        router14.pppg++ <--> router1.pppg++;
        router16.pppg++ <--> Eth10G <--> pgw25.pppg++;
        router16.pppg++ <--> Eth10G <--> pgw19.pppg++;
        router16.pppg++ <--> pgw22.pppg++;
        router16.pppg++ <--> pgw15.pppg++;
        router16.pppg++ <--> pgw18.pppg++;
        pgw22.filterGate <--> router15.pppg++;
        pgw19.filterGate <--> router15.pppg++;
        pgw18.filterGate <--> router15.pppg++;
        pgw15.filterGate <--> router15.pppg++;
        pgw25.filterGate <--> router15.pppg++;
}
