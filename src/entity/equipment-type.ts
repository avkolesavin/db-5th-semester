import { Column, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Season } from './season';

@Entity()
export class EquipmentType {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @ManyToOne(() => Season)
    season: Season;

    @ManyToOne(() => EquipmentType, equipmentType => equipmentType.children, { nullable: true })
    parent?: EquipmentType;

    @OneToMany(() => EquipmentType, equipmentType => equipmentType.parent)
    children: EquipmentType[];
}
