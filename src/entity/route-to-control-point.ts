import { Entity, PrimaryColumn, ManyToOne } from 'typeorm';
import { Route } from './route';
import { ControlPoint } from './control-point';

@Entity('routes_to_control_points')
export class RouteToControlPoint {
    @PrimaryColumn()
    private routeId: number;

    @ManyToOne(() => Route, route => route.routeToControlPoints)
    route: Route;

    @PrimaryColumn()
    private controlPointId: number;

    @ManyToOne(() => ControlPoint, controlPoint => controlPoint.routeToControlPoints)
    controlPoint: ControlPoint;
}
