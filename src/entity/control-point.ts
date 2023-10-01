import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { ControlPointToSeason } from './control-point-to-season';
import { RouteToControlPoint } from './route-to-control-point';

@Entity()
export class ControlPoint {
    @PrimaryGeneratedColumn()
    id: number;

    @Column('float')
    lat: number;

    @Column('float')
    long: number;

    @Column()
    name: string;

    @Column('text')
    description;

    @OneToMany(() => ControlPointToSeason, controlPointToSeason => controlPointToSeason.controlPoint)
    controlPointToSeasons: ControlPointToSeason[];

    @OneToMany(() => RouteToControlPoint, routeToControlPoint => routeToControlPoint.controlPoint)
    routeToControlPoints: RouteToControlPoint[];
}
