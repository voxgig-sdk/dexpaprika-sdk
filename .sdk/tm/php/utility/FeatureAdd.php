<?php
declare(strict_types=1);

// Dexpaprika SDK utility: feature_add

class DexpaprikaFeatureAdd
{
    public static function call(DexpaprikaContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
