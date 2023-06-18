 #pragma  once
 #include  <drogon/HttpController.h>

using namespace drogon;

namespace external
{
class ExternalModelController : public drogon::HttpController<ExternalModelController>
{
  public:
    METHOD_LIST_BEGIN
    METHOD_ADD(ExternalModelController::getData, "/{1}", Get);
    METHOD_LIST_END

    void getData(const HttpRequestPtr &req,
                  std::function<void(const HttpResponsePtr &)> &&callback,
                  std::string dataID) const; // ← method add のパス設定で{1}として指定されたものが入ります。

    const std::string createSQL() const;
};
}
