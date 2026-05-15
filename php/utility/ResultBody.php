<?php
declare(strict_types=1);

// Dexpaprika SDK utility: result_body

class DexpaprikaResultBody
{
    public static function call(DexpaprikaContext $ctx): ?DexpaprikaResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
