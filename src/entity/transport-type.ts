import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class TransportType {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column({ type: 'text', nullable: true })
    description?: string;
}
