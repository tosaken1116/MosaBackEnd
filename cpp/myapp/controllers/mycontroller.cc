#include "mycontroller.h"

void mycontroller::asyncHandleHttpRequest(const HttpRequestPtr& req, std::function<void (const HttpResponsePtr &)> &&callback)
{
    auto resp = HttpResponse::newHttpResponse();  // 新しいレスポンスインスタンスを生成
    resp->setStatusCode(k200OK);            // HTTPステータスコード 200に設定
    resp->setBody("Hello World!"); // Body:
    callback(resp);
}
