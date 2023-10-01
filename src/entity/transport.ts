import { Column, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { TransportType } from './transport-type';
import { TourLogToTransport } from './tours-log-to-transport';

@Entity()
export class Transport {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column('int')
    humanCapacity: number;

    @Column('float')
    luggageVolume: number;

    @Column({ type: 'decimal', precision: 10, scale: 2 })
    price: number;

    @ManyToOne(() => TransportType)
    transportType: TransportType;

    @OneToMany(() => TourLogToTransport, tourLogToTransport => tourLogToTransport.transport)
    tourLogToTransport: TourLogToTransport[];
}
