<?php

declare(strict_types=1);

namespace App\Domain\Strava\Segment\ReadModel;

use App\Domain\Strava\Segment\Segment;
use App\Domain\Strava\Segment\SegmentId;
use App\Domain\Strava\Segment\Segments;

interface SegmentDetailsRepository
{
    public function find(SegmentId $segmentId): Segment;

    public function findAll(): Segments;
}
