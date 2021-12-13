#Tabla calendar_event_type
UPDATE calendar_event_type SET short_description = 'Llamada' WHERE short_description = 'Call';
UPDATE calendar_event_type SET short_description = 'Correo Electrónico' WHERE short_description = 'Email';
UPDATE calendar_event_type SET short_description = 'Entrevista' WHERE short_description = 'Interview';
UPDATE calendar_event_type SET short_description = 'Cita' WHERE short_description = 'Meeting';
UPDATE calendar_event_type SET short_description = 'Otra' WHERE short_description = 'Other';
UPDATE calendar_event_type SET short_description = 'En Persona' WHERE short_description = 'Personal';

#Tabla access_level short_description
UPDATE access_level SET short_description = 'Administrador del Sitio' WHERE short_description = 'Site Administrator';
UPDATE access_level SET short_description = 'Administrador Raíz' WHERE short_description = 'Root';
UPDATE access_level SET short_description = 'Solo Lectura' WHERE short_description = 'Read Only';
UPDATE access_level SET short_description = 'Agregar / Editar / Eliminar' WHERE short_description = 'Add / Edit / Delete';
UPDATE access_level SET short_description = 'Agregar / Editar' WHERE short_description = 'Add / Edit';
UPDATE access_level SET short_description = 'Cuenta Deshabilitada' WHERE short_description = 'Account Disabled';

#Tabla access_level long_description
UPDATE access_level SET long_description = 'Administrador del Sitio: Todo acceso inferior, más la capacidad de agregar, editar y eliminar usuarios del sitio, así como la capacidad de editar la configuración del sitio.' WHERE long_description = 'Site Administrator - All lower access, plus the ability to add, edit, and remove site users, as well as the ability to edit site settings.';
UPDATE access_level SET long_description = 'Administrador Raíz: Todos los accesos inferiores, además de la capacidad de agregar, editar y eliminar sitios, así como la capacidad de asignar el estado de Administrador del sitio a un usuario.' WHERE long_description = 'Root Administrator - All lower access, plus the ability to add, edit, and remove sites, as well as the ability to assign Site Administrator status to a user.';
UPDATE access_level SET long_description = 'Solo Lectura: Un usuario estándar que puede ver datos en el sistema en modo de solo lectura.' WHERE long_description = 'Read Only - A standard user that can view data on the system in a read-only mode.' ;
UPDATE access_level SET long_description = 'Eliminar: Todos los accesos inferiores, más la capacidad de eliminar información en el sistema.' WHERE long_description = 'Delete - All lower access, plus the ability to delete information on the system.';
UPDATE access_level SET long_description = 'Editar: Todos los accesos inferiores, además de la capacidad de editar información en el sistema.' WHERE long_description = 'Edit - All lower access, plus the ability to edit information on the system.';
UPDATE access_level SET long_description = 'Deshabilitado: El nivel de acceso más bajo. El usuario no puede iniciar sesión.' WHERE long_description = 'Disabled - The lowest access level. User cannot log in.';