import { Column, Entity, JoinTable, ManyToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Tourist } from './tourist';

@Entity()
export class ToursLog {
    @PrimaryGeneratedColumn()
    id: number;

    @Column('date')
    startDate: string;

    @Column('date')
    endDate: string;

    @Column('json')
    testPoint: number[][];

    @ManyToMany(() => Tourist)
    @JoinTable()
    tourists: Tourist[];
}
