import { Entity, ManyToOne, PrimaryColumn } from 'typeorm';

import { ControlPoint } from './control-point';
import { Season } from './season';

@Entity('control_points_to_seasons')
export class ControlPointToSeason {
    @PrimaryColumn()
    private controlPointId: number;

    @ManyToOne(() => ControlPoint, controlPoint => controlPoint.controlPointToSeasons)
    controlPoint: ControlPoint;

    @PrimaryColumn()
    private seasonId: number;

    @ManyToOne(() => Season, season => season.controlPointToSeasons)
    season: Season;
}
