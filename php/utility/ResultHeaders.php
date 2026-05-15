<?php
declare(strict_types=1);

// Dexpaprika SDK utility: result_headers

class DexpaprikaResultHeaders
{
    public static function call(DexpaprikaContext $ctx): ?DexpaprikaResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
