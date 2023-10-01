import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class TouristCategory {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column('text')
    description: string;
}
