import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { ControlPointToSeason } from './control-point-to-season';

@Entity()
export class Season {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column('date')
    startDate: string;

    @Column('date')
    endDate: string;

    @OneToMany(() => ControlPointToSeason, controlPointToSeasons => controlPointToSeasons.season)
    controlPointToSeasons: ControlPointToSeason[];
}
