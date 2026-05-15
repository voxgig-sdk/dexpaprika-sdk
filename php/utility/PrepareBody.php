<?php
declare(strict_types=1);

// Dexpaprika SDK utility: prepare_body

class DexpaprikaPrepareBody
{
    public static function call(DexpaprikaContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
