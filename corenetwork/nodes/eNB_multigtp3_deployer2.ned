//
//                           SimuLTE
//
// This file is part of a software released under the license included in file
// "license.pdf". This license can be also found at http://www.ltesimulator.com/
// The above file and the present reference are part of the software itself,
// and cannot be removed from it.
//


package lte.corenetwork.nodes;

import inet.linklayer.ppp.PPPInterface;
import inet.mobility.static.StationaryMobility;
import inet.networklayer.common.InterfaceTable;
import inet.networklayer.ipv4.IPv4RoutingTable;
import inet.networklayer.contract.IRoutingTable;
import inet.networklayer.contract.INetworkLayer;
import inet.transportlayer.udp.UDP;
import lte.corenetwork.deployer.LteDeployer2;
import lte.epc.TrafficFlowFilterSimplified2;
import lte.epc.gtp.GtpUserSimplified4;
import lte.stack.phy.LteNicENBModified2;


//
// eNodeB module with support for EPC (GTP-U, etc).
//
module eNB_multigtp3_deployer2
{
    parameters:
        @networkNode();
        @display("i=device/antennatower;bgb=751,360");

        //# Node specs
        string nodeType = "ENODEB";        // DO NOT CHANGE
        int macNodeId = default(0); // TODO: this is not a real parameter
        int macCellId = default(0);  // TODO: this is not a real parameter
        double txPower @unit(mw) = default(100mw);
        bool d2dCapable = default(false);
        string nicType = d2dCapable ? "LteNicEnbD2D" : "LteNicEnb";

        //# Network Layer specs
        string networkLayerType = default("IPv4NetworkLayer");
        string routingTableType = default("IPv4RoutingTable");
        *.interfaceTableModule = default(absPath(".interfaceTable"));
        *.routingTableModule = default(routingTableType != "" ? absPath(".routingTable") : "");

        int numTcpApps = default(0);  // no of TCP apps. Specify the app types in INI file with tcpApp[0..1].typename="TCPEchoApp" syntax
        int numUdpApps = default(0);  // no of UDP apps. Specify the app types in INI file with udpApp[0..1].typename="UDPVideoStreamCli" syntax
        int numX2Apps = default(0);   // no of X2 apps. Specify the app types in INI file with x2App[0..1].typename="X2AppClient" syntax

    gates:
        inout ppp;     // connection to LteIP peer
        input radioIn @directIn;  // connection to slave

    submodules:
        interfaceTable: InterfaceTable {
            @display("p=50,75;is=s");
        }
        // TODO: should not include a routing table
        // routing table
        routingTable: <routingTableType> like IRoutingTable if routingTableType != "" {
            parameters:
                @display("p=50,125;is=s");
        }
        mobility: StationaryMobility {
            @display("p=50,175;is=s");
        }
        // NOTE: LteDeployer must be created first
        deployer: LteDeployer2 {
            @display("p=50,225;is=s");
        }
        // NOTE: instance must be named "nic"
        // TODO: rename to something like lte?
        nic: LteNicENBModified2 {
            nodeType = nodeType;

            d2dCapable = d2dCapable;
            @display("p=200,311");
        }
        pppIf: PPPInterface {
            @display("p=569,311");
        }
        trafficFlowFilter: TrafficFlowFilterSimplified2 {
            ownerType = nodeType;
            @display("p=200,144");
        }
        udp: UDP {
            @display("p=569,144");
        }
        // network layer
        networkLayer: <networkLayerType> like INetworkLayer {
            parameters:
                @display("p=501,269;q=queue");
        }
        gtpUser: GtpUserSimplified4 {
            @display("p=381,83");
        }
        gtpUser1: GtpUserSimplified4 {
            @display("p=381,167");
        }
    connections allowunconnected:
        //#
        //# Internal LTE stack to PHY and
        //# Lte IP connections
        //#


        //#
        //# External connection to peer Lte Ip and air interface
        //#

        nic.radioIn <-- radioIn;
        pppIf.phys <--> ppp;

        udp.ipOut --> networkLayer.transportIn++;
        udp.ipIn <-- networkLayer.transportOut++;

        trafficFlowFilter.gtpUserGateOut0 --> gtpUser.trafficFlowFilterGate;
        trafficFlowFilter.gtpUserGateOut1 --> gtpUser1.trafficFlowFilterGate;
        gtpUser.udpOut --> udp.appIn++;
        gtpUser.udpIn <-- udp.appOut++;

        networkLayer.ifOut++ --> pppIf.upperLayerIn;
        pppIf.upperLayerOut --> networkLayer.ifIn++;

        nic.upperLayerOut --> trafficFlowFilter.internetFilterGateIn;
        gtpUser.pppGate --> nic.upperLayerIn;
        gtpUser1.udpOut --> udp.appIn++;
        udp.appOut++ --> gtpUser1.udpIn;
}
