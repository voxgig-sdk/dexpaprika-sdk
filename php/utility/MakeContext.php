<?php
declare(strict_types=1);

// Dexpaprika SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class DexpaprikaMakeContext
{
    public static function call(array $ctxmap, ?DexpaprikaContext $basectx): DexpaprikaContext
    {
        return new DexpaprikaContext($ctxmap, $basectx);
    }
}
