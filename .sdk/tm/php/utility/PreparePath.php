<?php
declare(strict_types=1);

// Dexpaprika SDK utility: prepare_path

class DexpaprikaPreparePath
{
    public static function call(DexpaprikaContext $ctx): string
    {
        $point = $ctx->point;
        $parts = [];
        if ($point) {
            $p = \Voxgig\Struct\Struct::getprop($point, 'parts');
            if (is_array($p)) {
                $parts = $p;
            }
        }
        return \Voxgig\Struct\Struct::join($parts, '/', true);
    }
}
