import { Column, Entity, JoinTable, ManyToMany, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

import { Tourist } from './tourist';
import { Guide } from './guide';
import { TourLogToEquipment } from './tour-log-to-equipment';
import { Route } from './route';
import { TourLogToTransport } from './tours-log-to-transport';

@Entity()
export class ToursLog {
    @PrimaryGeneratedColumn()
    id: number;

    @Column('date')
    startDate: string;

    @Column('date')
    endDate: string;

    @ManyToOne(() => Route)
    route: Route;

    @ManyToMany(() => Tourist)
    @JoinTable({ name: 'tours_logs_to_tourists' })
    tourists: Tourist[];

    @ManyToMany(() => Guide)
    @JoinTable({ name: 'tours_logs_to_guides' })
    guides: Guide[];

    @OneToMany(() => TourLogToEquipment, tourLogToEquipment => tourLogToEquipment.tourLog)
    tourLogToEquipment: TourLogToEquipment[];

    @OneToMany(() => TourLogToTransport, tourLogToTransport => tourLogToTransport.tourLog)
    tourLogToTransport: TourLogToTransport[];
}
