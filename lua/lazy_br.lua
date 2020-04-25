local ae = ngx.req.get_headers()["Accept-Encoding"]
if (ae ~= nil and string.find(ae, "br")) then
    ngx.log(ngx.WARN, "brotli")
    ngx.exec(ngx.var.request_uri .. ".br")
end
