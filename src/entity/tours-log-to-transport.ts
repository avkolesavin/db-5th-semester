import { Entity, PrimaryColumn, ManyToOne, Column } from 'typeorm';
import { ToursLog } from './tours-log';
import { Transport } from './transport';

@Entity()
export class TourLogToTransport {
    @PrimaryColumn()
    private tourLogId: number;

    @ManyToOne(() => ToursLog, tourLog => tourLog.tourLogToTransport)
    tourLog: ToursLog;

    @PrimaryColumn()
    private transportId: number;

    @ManyToOne(() => Transport, transport => transport.tourLogToTransport)
    transport: Transport;

    @Column('int')
    count: number;
}
