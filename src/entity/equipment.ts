import { Column, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { EquipmentType } from './equipment-type';
import { TourLogToEquipment } from './tour-log-to-equipment';

@Entity()
export class Equipment {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column('float')
    weight: number;

    @Column('float')
    value: number;

    @Column('float')
    rentPrice: number;

    @Column('int')
    count: number;

    @ManyToOne(() => EquipmentType)
    equipmentType: EquipmentType;

    @OneToMany(() => TourLogToEquipment, tourLogToEquipment => tourLogToEquipment.tourLog)
    tourLogToEquipment: TourLogToEquipment[];
}
