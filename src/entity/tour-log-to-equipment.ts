import { Entity, PrimaryColumn, ManyToOne, Column } from 'typeorm';

import { ToursLog } from './tours-log';
import { Equipment } from './equipment';

@Entity()
export class TourLogToEquipment {
    @PrimaryColumn()
    private tourLogId: number;

    @ManyToOne(() => ToursLog, tourLog => tourLog.tourLogToEquipment)
    tourLog: ToursLog;

    @PrimaryColumn()
    private equipmentId: number;

    @ManyToOne(() => Equipment, equipment => equipment.tourLogToEquipment)
    equipment: Equipment;

    @Column('int')
    count: number;
}
