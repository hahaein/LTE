//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package lte.simulations.networks;
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
import lte.corenetwork.nodes.new_eNB2;
import lte.corenetwork.nodes.new_eNB3;
import lte.world.radio.LteChannelControl;
import lte.epc.PgwStandardSimplified;


network PGWBinder_ver1
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
            @display("p=557.2,65.91875;is=n;i=device/server");
        }
        router: Router {
            @display("p=541.03125,154.225;i=device/smallrouter");
        }
        pgw: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=369.39374,277.35626;is=l");
        }
            pgw2: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=567.15,277.35626;is=l");
        }
        pgw3: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=791.02496,256.2125;is=l");
        }
        ue1[numUe]: Ue {
            @display("p=237.55624,532.325");
        }
        ue2[numUe]: Ue {
            @display("p=598.2438,542.275");
        }
         ue3[numUe]: Ue {
            @display("p=848.2375,557.2");
        }
        router1: Router {
            @display("p=568.39374,391.78125");
        }
        eNodeB1: new_eNB {
            @display("p=347.00626,609.4375;is=vl");
        }
           eNodeB2: new_eNB2 {
            @display("p=523.6188,594.5125;is=vl");
        }
         eNodeB3: new_eNB3 {
            @display("p=731.325,618.14374;is=vl");
        }    
     
    connections:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        router1.pppg++ <--> Eth10G <--> eNodeB2.ppp;
        router1.pppg++ <--> Eth10G <--> pgw.pppg++;
        eNodeB1.ppp <--> Eth10G <--> router1.pppg++;
        pgw2.pppg++ <--> Eth10G <--> router1.pppg++;
        pgw3.pppg++ <--> Eth10G <--> router1.pppg++;
        pgw2.filterGate <--> Eth10G <--> router.pppg++;
        pgw3.filterGate <--> Eth10G <--> router.pppg++;
        router1.pppg++ <--> Eth10G <--> eNodeB3.ppp;
}