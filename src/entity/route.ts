import { Entity, PrimaryGeneratedColumn, Column, LineString, ManyToOne, OneToMany } from 'typeorm';
import { Season } from './season';
import { RouteDifficulty } from './route-difficulty';
import { RouteToControlPoint } from './route-to-control-point';

@Entity()
export class Route {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column('float')
    length: number;

    @Column('float')
    price: number;

    @Column({
        type: 'geography',
        spatialFeatureType: 'LineString',
        srid: 4326,
    })
    path: LineString;

    @ManyToOne(() => Season)
    season: Season;

    @ManyToOne(() => RouteDifficulty)
    routeDifficulty: RouteDifficulty;

    @OneToMany(() => RouteToControlPoint, routeToControlPoint => routeToControlPoint.route)
    routeToControlPoints: RouteToControlPoint[];
}
