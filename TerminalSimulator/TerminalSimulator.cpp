#include <iostream>
#include "talk/base/thread.h"
#include "talk/base/logging.h"
#include "talk/base/json.h"

#include "zmqclient/CameraClient.h"
#include "libjingle_app/jsonconfig.h"
#include "libjingle_app/defaults.h"
#include "libjingle_app/p2pconductor.h"
#include "libjingle_app/peerterminal.h"


#include "KeVideoSimulator.h"

using namespace std;


int kVersion = 54;

int main()
{
    JsonConfig::Instance()->FromFile(kaerp2p::GetAppFilePath("config.json"));
    Json::Value mac_value = JsonConfig::Instance()->Get("camera.mac","");
    Json::Value dealer_value = JsonConfig::Instance()->Get("dealerId","");
    Json::Value router_value =
            JsonConfig::Instance()->Get("routerUrl","tcp://192.168.40.191:5555");
    Json::Value logParamsValue =
            JsonConfig::Instance()->Get("logParams","tstamp thread info debug");
    Json::Value jservers = JsonConfig::Instance()->Get("servers","");
    //Json::Value jclarity = JsonConfig::Instance()->Get("clarity",2);
    Json::Value jlogsaveFile = JsonConfig::Instance()->Get("logSaveFile","");

    talk_base::LogMessage::ConfigureLogging(logParamsValue.asString().c_str(),
                                            jlogsaveFile.asString().c_str());

    //Json::Value jntp = JsonConfig::Instance()->Get("ntpconfig","");
    LOG(INFO)<<"json config : "<<JsonConfig::Instance()->ToString();
    std::string clientVer = kaerp2p::ToStringVersion(kVersion);
    LOG(INFO)<<"simulator current version is "<<clientVer;

    std::string serversStr  = JsonValueToString(jservers);
    kaerp2p::P2PConductor::AddIceServers(serversStr);

    std::string strDealerId;
    std::string strMac;
    GetStringFromJson(mac_value,&strMac);
    GetStringFromJson(dealer_value,&strDealerId);

//    ProfilerStart("zmq.prof");

    CameraClient client(strMac,clientVer);
    client.Connect(router_value.asString(),strDealerId);

    kaerp2p::PeerTerminal * terminal = new kaerp2p::PeerTerminal(&client);
//    kaerp2p::LocalUdpTerminal * terminal = new kaerp2p::LocalUdpTerminal();
//    terminal->Initialize("0.0.0.0:12345");

    Json::Value jsampleFile =
            JsonConfig::Instance()->Get("sampleFileName","sample.avi");
    std::string sampleFileName;
    if(!GetStringFromJson(jsampleFile,&sampleFileName)){
        return 2;
    }


    KeVideoSimulator * simulator = new KeVideoSimulator(sampleFileName);
    if(!simulator->Init(terminal)){
        return 1;
    }

    talk_base::Thread::Current()->Run();
    //talk_base::Thread::Current()->ProcessMessages(60000);
    std::cout << "===========delete simulator=========" <<std::endl;
    delete simulator;
    delete terminal;
//    ProfilerStop();

    return 0;
}

