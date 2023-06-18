#include "external_ExternalModelController.h"

using namespace external;

// Add definition of your processing function here
void ExternalModelController::getData(const HttpRequestPtr &req,
                                      std::function<void(const HttpResponsePtr &)> &&callback,
                                      std::string dataID) const
{
    try
    {
        auto futureObject =
            drogon::app()
                .getDbClient("default")
                ->execSqlAsyncFuture(createSQL(), dataID);

        if (std::future_status::timeout == futureObject.wait_for(std::chrono::seconds(3)))
        {
            auto resp = HttpResponse::newHttpResponse(); // 新しいレスポンスインスタンスを生成
            resp->setStatusCode(k200OK);                 // HTTPステータスコード 200に設定
            resp->setBody("TimeOut");                    // Body:
            callback(resp);
            // callback(HttpResponse::newHttpViewResponse("TimeOut.csp"));
        }
        else
        {
            // auto viewData = HttpViewData();

            auto result = futureObject.get();

            if (0 >= result.size())
            {
                return;
            }

            // viewData.insert("id", result[0]["id"].as<std::string>());
            // viewData.insert("user_id", result[0]["user_id"].as<std::string>());
            // viewData.insert("content", result[0]["content"].as<std::string>());
            // viewData.insert("created_at", result[0]["created_at"].as<std::string>());
            // viewData.insert("update_at", result[0]["update_at"].as<std::string>());

            auto resp = HttpResponse::newHttpResponse(); // 新しいレスポンスインスタンスを生成
            resp->setStatusCode(k200OK);                 // HTTPステータスコード 200に設定
            Json::Value jsonData;
            jsonData["id"] = result[0]["id"].as<std::string>();
            jsonData["title"] = result[0]["title"].as<std::string>();
            jsonData["description"] = result[0]["description"].as<std::string>();
            jsonData["owner_id"] = result[0]["owner_id"].as<std::string>();
            jsonData["is_public"] = result[0]["is_public"].as<std::string>();
            jsonData["group_id"] = result[0]["group_id"].as<std::string>();
            jsonData["start_time"] = result[0]["start_time"].as<std::string>();
            jsonData["end_time"] = result[0]["end_time"].as<std::string>();
            jsonData["count"] = result[0]["count"].as<std::string>();

            std::ostringstream oss;
            Json::StreamWriterBuilder writerBuilder;
            std::unique_ptr<Json::StreamWriter> writer(writerBuilder.newStreamWriter());
            writer->write(jsonData, &oss);
            std::string responseBody = oss.str();

            resp->setBody(responseBody);
            resp->addHeader("Content-Type", "application/json");

            callback(resp);
            // callback(HttpResponse::newHttpViewResponse("SampleView.csp", viewData));
        }
    }
    catch (const drogon::orm::DrogonDbException &e)
    {
        std::cerr << e.base().what() << '\n';
    }

    return;
}

const std::string ExternalModelController::createSQL() const
{
    return std::string("SELECT * FROM rooms WHERE id=$1::uuid");
}