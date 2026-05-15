<?php
declare(strict_types=1);

// Dexpaprika SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class DexpaprikaFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new DexpaprikaBaseFeature();
            case "test":
                return new DexpaprikaTestFeature();
            default:
                return new DexpaprikaBaseFeature();
        }
    }
}
