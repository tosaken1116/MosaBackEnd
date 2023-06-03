#pragma once

#include <drogon/HttpSimpleController.h>

using namespace drogon;

class mycontroller : public drogon::HttpSimpleController<mycontroller>
{
  public:
    virtual void asyncHandleHttpRequest(
    const HttpRequestPtr& req,
    std::function<void (const HttpResponsePtr &)> &&callback) override;
    // ルートへのアクセスに対して、Getリクエストへのレスポンスを定義します。
    PATH_LIST_BEGIN
    PATH_ADD( "/", Get);
    PATH_ADD("/hello", Get);
    PATH_LIST_END
};
