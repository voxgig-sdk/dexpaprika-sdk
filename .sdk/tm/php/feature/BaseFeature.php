<?php
declare(strict_types=1);

// Dexpaprika SDK base feature

class DexpaprikaBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(DexpaprikaContext $ctx, array $options): void {}
    public function PostConstruct(DexpaprikaContext $ctx): void {}
    public function PostConstructEntity(DexpaprikaContext $ctx): void {}
    public function SetData(DexpaprikaContext $ctx): void {}
    public function GetData(DexpaprikaContext $ctx): void {}
    public function GetMatch(DexpaprikaContext $ctx): void {}
    public function SetMatch(DexpaprikaContext $ctx): void {}
    public function PrePoint(DexpaprikaContext $ctx): void {}
    public function PreSpec(DexpaprikaContext $ctx): void {}
    public function PreRequest(DexpaprikaContext $ctx): void {}
    public function PreResponse(DexpaprikaContext $ctx): void {}
    public function PreResult(DexpaprikaContext $ctx): void {}
    public function PreDone(DexpaprikaContext $ctx): void {}
    public function PreUnexpected(DexpaprikaContext $ctx): void {}
}
